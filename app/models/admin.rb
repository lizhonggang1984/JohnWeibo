class Admin < ApplicationRecord

validates(:username, presence: true, length: {maximun: 20, minimum: 2},uniqueness: true)
EMAILFORMAT = /\A[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i
validates(:email, presence: true, length: {maximun: 50, minimum: 5}, format: {with: EMAILFORMAT}, uniqueness: {case_sensitive: false})
end
