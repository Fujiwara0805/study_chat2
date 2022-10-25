# README

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_k       | string              | null: false               |
| last_name_k        | string              | null: false               |
| date_of_birth      | date                | null: false               |

### Association

* has_many :items
* has_many :questions


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| text                                | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category_id

## questions table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| title                               | string     | null: false                    |
| content                             | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :answer

## answers table

| Column          | Type       | Options                        |
|---------------- |------------|--------------------------------|
| content         | text       | null: false                    |
| question_id     | integer    | null: false                    |
| name            | string     | null: false                    |


### Association

- belongs_to :question