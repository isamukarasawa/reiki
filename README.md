## users_テーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| username           | string     | null: false              |
| email              | string     | null: false, unique:true |
| encrypted_password | string     | null: false              |
| profile            | text       | null: false              |
| profile_image_id   | string     | null: false              |

### Association
- has_many :feelings

## feelings_テーブル

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| user_id              | integer     | null: false                    |
| body                 | text        | null: false                    |
| title                | string      | null: false                    |
| image_id             | string      | null: false                    |

### Association
- belongs_to :user
