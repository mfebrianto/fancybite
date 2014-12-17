class Order < ActiveRecord::Base

  belongs_to :customer
  has_many :order_detail

  before_create :unique_transaction_id
  # after_create :send_email

  def check_whether_purchase_is_made
    if self.order_details.empty?
      errors.add(:name, 'You hasn\'t purchased anything yet')
    end
    self.order_details.empty?
  end

  def generate_receipt
    generate_pdf
  end

  private

  def send_email
    OrderMailer.order_confirmation(customer).deliver
  end

  def unique_transaction_id
    self.transfer_key = SecureRandom.hex(3)
  end

  def generate_pdf
    pdf = Prawn::Document.new(page_size: [200,600], margin: [10, 5, 5, 5])
    pdf.image Rails.root.join('app','assets','images','logo','logobw.jpg'), scale: 0.2, :position => :center
    pdf.line [10,490], [290,490]
    order_detail.each do |od|
      pdf.draw_text od.quantity.to_s, at: [2, 480], size: 10
      pdf.draw_text od.menu_item.name, at: [20, 480], size: 10
      pdf.draw_text od.menu_item.price.to_s, at: [100, 480], size: 10
      pdf.draw_text (od.menu_item.price * od.quantity).to_s, at: [150, 480], size: 10
    end
    pdf.render_file "receipts/receipt.pdf"
  end

end