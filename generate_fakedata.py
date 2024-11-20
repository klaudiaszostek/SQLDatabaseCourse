from faker import Faker
import random
from collections import defaultdict

fake = Faker()

# Generating data for the `customers` table
def generate_customers():
    customers = []
    for _ in range(20):
        customers.append((
            fake.unique.bothify(text='CUS#####'),             # customer_id
            fake.password(length=random.randint(4, 10)),      # password
            fake.company(),                                   # name
            fake.city(),                                      # city
            fake.unique.bothify(text='##-###'),               # postal_code
            fake.street_address(),                            # address
            fake.email(),                                     # email
            fake.unique.bothify(text='+###########'),         # phone
            fake.unique.bothify(text='######@e-fax.com'),     # fax
            fake.unique.bothify(text='PL###########'),        # tax_id
            fake.unique.bothify(text='#########')             # company_id
        ))
    return customers

# Generating data for the `compositions` table
def generate_compositions():
    compositions = []
    for _ in range(20):
        compositions.append((
            fake.unique.bothify(text='CMP##'),      # composition_id
            fake.word().capitalize(),               # name
            fake.sentence(nb_words=5),              # description
            round(random.uniform(10, 150), 2),      # price
            random.randint(1, 10),                  # minimum_quantity
            random.randint(1, 100)                  # stock
        ))
    return compositions

# Generating data for the `recipients` table
def generate_recipients():
    recipients = []
    for _ in range(20):
        recipients.append((
            fake.company(),                        # name
            fake.city(),                           # city
            fake.unique.bothify(text='##-###'),    # postal_code
            fake.street_address()                  # address
        ))
    return recipients

# Generating data for the `orders` table
def generate_orders(customer_ids, recipient_ids, composition_ids):
    orders = []
    for _ in range(20):
        date = fake.date_between(start_date='-1y', end_date='today')
        formatted_date = date.strftime('%Y-%m-%d')  # date formatting
        orders.append((
            fake.unique.random_int(1, 10000),     # order_id
            random.choice(customer_ids),          # customer_id
            random.choice(recipient_ids),         # recipient_id
            random.choice(composition_ids),       # composition_id
            formatted_date,                       # date
            round(random.uniform(10, 1000), 2),   # price
            random.choice([True, False]),         # paid
            fake.sentence(nb_words=10)            # notes
        ))
    return orders

# Generating data for the `requirements` table
def generate_requirements(composition_ids):
    requirements_dict = defaultdict(lambda: {'quantity': 0, 'price': 0.0})  # To sum quantity and price for each composition_id
    
    for _ in range(20):  # Number of entries to simulate
        composition_id = random.choice(composition_ids)  # Choose an existing composition_id
        quantity = random.randint(1, 100)  # Random quantity
        price = round(random.uniform(10, 1000), 2)  # Random price
        
        # Aggregate quantity and price for the same composition_id
        requirements_dict[composition_id]['quantity'] += quantity
        requirements_dict[composition_id]['price'] += price
    
    # Flatten aggregated data into a list of tuples
    requirements = [
        (comp_id, data['quantity'], round(data['price'], 2))
        for comp_id, data in requirements_dict.items()
    ]
    
    return requirements

# Main function
def main():
    # Generating data
    customers = generate_customers()
    compositions = generate_compositions()
    recipients = generate_recipients()
    
    # Creating ID lists for relationships
    customer_ids = [c[0] for c in customers]
    composition_ids = [c[0] for c in compositions]
    recipient_ids = list(range(1, len(recipients) + 1))  # recipient_id is serial
    
    orders = generate_orders(customer_ids, recipient_ids, composition_ids)
    requirements = generate_requirements(composition_ids)
    
    # Displaying results as SQL
    print("INSERT INTO customers(customer_id, password, name, city, postal_code, address, email, phone, fax, tax_id, company_id) VALUES")
    for c in customers:
        print(f"{c},")
    
    print("\nINSERT INTO compositions(composition_id, name, description, price, minimum_quantity, stock) VALUES")
    for c in compositions:
        print(f"{c},")
    
    print("\nINSERT INTO recipients(name, city, postal_code, address) VALUES")
    for r in recipients:
        print(f"{r},")
    
    print("\nINSERT INTO orders(order_id, customer_id, recipient_id, composition_id, date, price, paid, notes) VALUES")
    for o in orders:
        print(f"{o},")
    
    print("\nINSERT INTO requirements(composition_id, quantity, price) VALUES")
    for r in requirements:
        print(f"{r},")

if __name__ == "__main__":
    main()
