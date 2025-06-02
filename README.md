
# 📘 멘토시리즈: 데이터베이스 입문 실습 파일

이 저장소는 **《멘토시리즈 데이터베이스 입문》 교재**의 실습을 위한 SQL 스크립트를 제공합니다.  
Oracle 19c 환경을 기준으로 하며, MENTORMALL이라는 가상의 전자상거래 플랫폼 데이터를 활용합니다.

---

## 📂 파일 구성

| 파일명 | 설명 |
|--------|------|
| `MENTORMALL_FINAL_SCHEMA.sql` | 전체 테이블 및 시퀀스 생성용 DDL 스크립트 |
| `MENTORMALL_SAMPLE_DATA.sql` | 예제 데이터를 삽입하는 INSERT 스크립트 |
| `README.md` | 실습 파일에 대한 설명 및 사용 방법 안내 |

---

## 🏗️ 실습 환경 요구사항

- **DBMS**: Oracle Database 19c 이상  
- **클라이언트 툴**: DBeaver 또는 Oracle SQL Developer  
- **접속 정보 예시**:
  - 호스트: `localhost`
  - 포트: `1521`
  - 서비스명: `orclpdb`
  - 사용자: `mentormall`

---

## ⚙️ 실행 순서

1. Oracle DB 접속 후, 아래 스크립트 실행

```sql
-- 1단계: 테이블 및 시퀀스 생성
@MENTORMALL_FINAL_SCHEMA.sql

-- 2단계: 예제 데이터 삽입
@MENTORMALL_SAMPLE_DATA.sql
````

또는 DBeaver에서 `.sql` 파일을 열어 **전체 실행(Ctrl + Shift + X)**

---

## 🧱 주요 테이블 구성

* `customers`: 고객 정보
* `products`: 상품 정보
* `categories`: 상품 분류
* `orders`: 주문 내역
* `order_items`: 주문 상세
* `reviews`: 상품 리뷰
* `product_images`: 상품 이미지 정보
* `stock_movements`: 입출고 이력
* `warehouse_stocks`: 창고별 재고
* `product_options`: 상품 옵션

---

## 📌 참고

* 본 SQL 파일은 교육용으로 제공되며, Oracle 19c 환경에 최적화되어 있습니다.
* Oracle 21c 및 타 DBMS 사용 시 문법 차이에 유의하시기 바랍니다.

---

## 📝 라이선스

해당 실습 파일은 [MIT License](LICENSE) 하에 배포됩니다.

---

## 📬 문의

교재 또는 실습 환경 관련 문의는 다음 이메일로 연락해주세요:
📧 lec.shjin@gmil.com


