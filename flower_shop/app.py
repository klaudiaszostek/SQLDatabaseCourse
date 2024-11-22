from flask import Flask, render_template, request, redirect, session, flash
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Database configuration
db_config = {
    'MYSQL_HOST': 'localhost',
    'MYSQL_USER': 'root',
    'MYSQL_PASSWORD': 'password', # database password
    'MYSQL_DB': 'flower_shop'
}
app.config.update(db_config)

mysql = MySQL(app)


# Route: Home
@app.route('/')
def home():
    return render_template('index.html')


# Route: Customer Registration
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        data = request.form
        cursor = mysql.connection.cursor()
        try:
            cursor.execute(
                "INSERT INTO customers(customer_id, password, name, city, postal_code, address, email, phone) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                (data['customer_id'], data['password'], data['name'], data['city'], data['postal_code'], data['address'], data['email'], data['phone'])
            )
            mysql.connection.commit()
            flash('Registration successful! You can now log in.', 'success')
            return redirect('/login')
        except Exception as e:
            flash('Registration failed. Please try again.', 'danger')
        finally:
            cursor.close()
    return render_template('register.html')



# Route: Customer Login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        customer_id = request.form['customer_id']
        password = request.form['password']
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM customers WHERE customer_id = %s AND password = %s", (customer_id, password))
        customer = cursor.fetchone()
        cursor.close()
        if customer:
            session['customer_id'] = customer_id
            flash('Login successful!', 'success')
            return redirect('/compositions')
        else:
            flash('Invalid credentials. Please try again.', 'danger')
            return redirect('/login')
    return render_template('login.html')



# Route: View Compositions
@app.route('/compositions', methods=['GET', 'POST'])
def compositions():
    if 'customer_id' not in session:
        return redirect('/login')
    
    customer_id = session['customer_id']
    cursor = mysql.connection.cursor()
    
    # Fetch compositions
    cursor.execute("SELECT composition_id, name, price, description, stock FROM compositions")
    compositions = cursor.fetchall()
    
    # Fetch customer details
    cursor.execute("""
        SELECT name, city, postal_code, address 
        FROM customers 
        WHERE customer_id = %s
    """, (customer_id,))
    customer_details = cursor.fetchone()
    cursor.close()
    
    return render_template(
        'compositions.html', 
        compositions=compositions, 
        customer_details=customer_details
    )


# Route: Place Order
@app.route('/order', methods=['POST'])
def order():
    if 'customer_id' not in session:
        return redirect('/login')
    data = request.form
    customer_id = session['customer_id']
    cursor = mysql.connection.cursor()

    # Find the maximum order_id
    cursor.execute("SELECT IFNULL(MAX(order_id), 0) + 1 FROM orders")
    new_order_id = cursor.fetchone()[0]

    # Insert recipient data
    cursor.execute(
        "INSERT INTO recipients(name, city, postal_code, address) VALUES (%s, %s, %s, %s)",
        (data['recipient_name'], data['city'], data['postal_code'], data['address'])
    )
    recipient_id = cursor.lastrowid

    # Insert order
    cursor.execute(
        "INSERT INTO orders(order_id, customer_id, recipient_id, composition_id, date, price, paid, notes) "
        "VALUES (%s, %s, %s, %s, CURDATE(), %s, %s, %s)",
        (new_order_id, customer_id, recipient_id, data['composition_id'], data['price'], False, data['notes'])
    )

    # Update stock
    cursor.execute(
        "UPDATE compositions SET stock = stock - 1 WHERE composition_id = %s", (data['composition_id'],)
    )
    mysql.connection.commit()
    cursor.close()

    flash('Your order has been successfully placed!', 'success')
    return redirect('/orders')



@app.route('/orders')
def orders():
    if 'customer_id' not in session:
        flash('Please log in to view your orders.', 'danger')
        return redirect('/login')
    
    customer_id = session['customer_id']
    cursor = mysql.connection.cursor()
    
    # Query to fetch orders for the logged-in customer
    cursor.execute("""
        SELECT 
            o.order_id,
            c.name AS composition_name,
            o.date,
            o.price,
            o.paid,
            r.name AS recipient_name,
            r.city,
            r.postal_code,
            r.address,
            o.notes
        FROM orders o
        JOIN compositions c ON o.composition_id = c.composition_id
        JOIN recipients r ON o.recipient_id = r.recipient_id
        WHERE o.customer_id = %s
        ORDER BY o.date DESC
    """, (customer_id,))
    
    orders = cursor.fetchall()
    cursor.close()
    
    return render_template('orders.html', orders=orders)


# Route: Inventory Management (Admin)
@app.route('/inventory')
def inventory():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM compositions WHERE stock <= 5")
    low_stock = cursor.fetchall()
    cursor.close()
    return render_template('inventory.html', low_stock=low_stock)


# Route: Logout
@app.route('/logout')
def logout():
    session.pop('customer_id', None)
    flash('Logged out successfully.', 'success')
    return redirect('/')


if __name__ == '__main__':
    app.run(debug=True)
