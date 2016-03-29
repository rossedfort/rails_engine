require 'csv'

class Seed
  def self.start
    create_customers
    create_merchants
    create_items
    create_invoices
    create_invoice_items
    create_transactions
  end

  def self.create_customers
    CSV.readlines('data/customers.csv', headers: true, header_converters: :symbol).each do |row|
        Customer.create!(row.to_h)
    end
  end

  def self.create_merchants
    CSV.readlines('data/merchants.csv', headers: true, header_converters: :symbol).each do |row|
        Merchant.create!(row.to_h)
    end
  end

  def self.create_items
    CSV.readlines('data/items.csv', headers: true, header_converters: :symbol).each do |row|
      Item.create!(row.to_h)
    end
  end

  def self.create_invoices
    CSV.readlines('data/invoices.csv', headers: true, header_converters: :symbol).each do |row|
      Invoice.create!(row.to_h)
    end
  end

  def self.create_invoice_items
    CSV.readlines('data/invoice_items.csv', headers: true, header_converters: :symbol).each do |row|
      InvoiceItem.create!(row.to_h)
    end
  end

  def self.create_transactions
    CSV.readlines('data/transactions.csv', headers: true, header_converters: :symbol).each do |row|
      Transaction.create!({id:                row[:id],
                          invoice_id:         row[:invoice_id],
                          credit_card_number: row[:credit_card_number],
                          result:             row[:result],
                          created_at:         row[:created_at],
                          updated_at:         row[:updated_at]})
    end
  end
end

Seed.start
