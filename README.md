# README

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |

### Association

* has_many :questions
* has_many :likes, dependent: :destroy
* has_many :liked_questions, through: :likes, source: :question

## questions table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| title                               | string     | null: false                    |
| video                               | string     |                                |
| youtube_url                         | string     |                                |
| content                             | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :answers
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user

## answers table

| Column          | Type       | Options                        |
|---------------- |------------|--------------------------------|
| content         | text       | null: false                    |
| question_id     | integer    | null: false                    |
| name            | string     | null: false                    |


### Association

- belongs_to :question

## likes table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| question                            | references | null: false, foreign_key: true |
| user                                | references | null: false, foreign_key: true |


### Association

- belongs_to :question
- belongs_to :user