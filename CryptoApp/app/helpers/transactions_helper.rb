module TransactionsHelper
  class NewTransactionValidator < ActiveModel::Validator
    def validate(record)
      current_user.wallet.validate_transaction(record.CSold, record.CS_Amount)
    end
  end
end
