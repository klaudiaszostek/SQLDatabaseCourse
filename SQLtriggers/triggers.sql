
-- 1

DROP TRIGGER IF EXISTS orders_management;
DELIMITER //
CREATE TRIGGER orders_management
    BEFORE INSERT ON orders
    FOR EACH ROW
BEGIN
    UPDATE compositions SET stock=(stock-1) WHERE composition_id = NEW.composition_id;
    SET @minimum_quantity = (SELECT minimum_quantity FROM compositions WHERE composition_id = NEW.composition_id);
    SET @stock = (SELECT stock FROM compositions WHERE composition_id = NEW.composition_id);
    SET @price = (SELECT price FROM compositions WHERE composition_id = NEW.composition_id);
    IF @stock<@minimum_quantity THEN
        UPDATE requirements SET quantity = (@minimum_quantity-@stock) WHERE composition_id = NEW.composition_id;
        UPDATE requirements SET price = @price WHERE composition_id = NEW.composition_id;
    END IF;
    SET @price = (SELECT price FROM compositions WHERE composition_id = NEW.composition_id);
    SET NEW.price = (@price*0.8);
END;
//
DELIMITER ;


INSERT INTO orders(order_id, customer_id, recipient_id, composition_id, date, price, paid, notes) VALUES
(6666, 'CUS98777', 1, 'CMP34', '2025-02-22', 85.41, True, 'Whether call join serious upon different collection condition.'),
(7777, 'CUS98777', 12, 'CMP34', '2025-02-22', 85.41, False, 'Name executive ago police carry top rate outside oil describe training often.'),
(8888, 'CUS98777', 3, 'CMP34', '2025-02-22', 85.41, True, 'Middle number fish somebody reflect consumer like.'),
(9999, 'CUS98777', 10, 'CMP34', '2025-02-22', 85.41, True, 'Pressure free crime everybody eat design style peace possible treat.');



------------------------------------------------------------------
-- 2

DELIMITER //
CREATE TRIGGER delivery_management
    AFTER UPDATE ON compositions
    FOR EACH ROW
BEGIN
    SET @minimum_quantity = (SELECT minimum_quantity FROM compositions WHERE composition_id = NEW.composition_id);
    SET @stock = (SELECT stock FROM compositions WHERE composition_id = NEW.composition_id);
    IF @minimum_quantity>@stock THEN
        UPDATE requirements SET quantity=(@minimum_quantity-@stock) WHERE composition_id = NEW.composition_id;
    ELSE
        UPDATE requirements SET quantity=0 WHERE composition_id = NEW.composition_id;
    END IF;
END;
//
DELIMITER ;


UPDATE compositions SET stock=(minimum_quantity+5) WHERE composition_id='CMP34';
