
-- ==============================
-- MENTORMALL 기준 스키마 정의서
-- ==============================

-- 고객 테이블
CREATE TABLE customers (
    customer_id      NUMBER PRIMARY KEY,
    name             VARCHAR2(100) NOT NULL,
    email            VARCHAR2(100),
    phone            VARCHAR2(20) UNIQUE,
    registered_date  DATE DEFAULT SYSDATE,
    is_active        CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N'))
);

-- 카테고리 테이블
CREATE TABLE categories (
    category_id     NUMBER PRIMARY KEY,
    parent_id       NUMBER,
    category_name   VARCHAR2(100) NOT NULL,
    category_level  NUMBER(1) CHECK (category_level IN (1, 2, 3)),
    CONSTRAINT fk_categories_parent FOREIGN KEY (parent_id)
        REFERENCES categories(category_id)
);

-- 상품 테이블
CREATE TABLE products (
    product_id      NUMBER PRIMARY KEY,
    name            VARCHAR2(200) NOT NULL,
    category_id     NUMBER,
    price           NUMBER(10, 2),
    stock_quantity  NUMBER,
    created_at      DATE DEFAULT SYSDATE,
    CONSTRAINT fk_products_category FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

-- 주문 테이블
CREATE TABLE orders (
    order_id     NUMBER PRIMARY KEY,
    customer_id  NUMBER NOT NULL,
    order_date   DATE DEFAULT SYSDATE,
    status       VARCHAR2(20),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- 주문 상세 테이블
CREATE TABLE order_items (
    order_item_id  NUMBER PRIMARY KEY,
    order_id       NUMBER NOT NULL,
    product_id     NUMBER NOT NULL,
    quantity       NUMBER NOT NULL,
    price_each     NUMBER(10, 2),
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_order_items_product FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- 리뷰 테이블
CREATE TABLE reviews (
    review_id     NUMBER PRIMARY KEY,
    customer_id   NUMBER NOT NULL,
    product_id    NUMBER NOT NULL,
    rating        NUMBER(1) CHECK (rating BETWEEN 1 AND 5),
    content       VARCHAR2(1000),
    created_at    DATE DEFAULT SYSDATE,
    CONSTRAINT fk_reviews_customer FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    CONSTRAINT fk_reviews_product FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


-- ==============================
-- 시퀀스 생성
-- ==============================
CREATE SEQUENCE seq_customers START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_categories START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_products START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_orders START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_order_items START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_reviews START WITH 1 INCREMENT BY 1 NOCACHE;
