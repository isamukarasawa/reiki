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

## items_テーブル

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| user_id              | string      | null: false                    |
| type                 | text        | null: false                    |
| feeling              | integer     | null: false                    |

### Association
- belongs_to :user
