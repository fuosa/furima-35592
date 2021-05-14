FactoryBot.define do
  factory :user do
    nickname                     {'test'}
    email                        {'test@example'}
    password                     {'a00000'}
    password_confirmation        {'a00000'}
    family_name                  {"山田"}
    first_name                   {"隆太郎"}
    family_name_kana             {"ヤマダ"}
    first_name_kana              {"リクタロウ"}
    date_of_birth                {"2020-01-01"}
  end
end