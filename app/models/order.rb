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

  def total
    total = 0
    order_detail.each do |od|
      total += od.quantity * od.menu_item.price
    end
    total
  end

  private

  def send_email
    OrderMailer.order_confirmation(customer).deliver
  end

  def unique_transaction_id
    self.transfer_key = SecureRandom.hex(3)
  end

  def generate_pdf
    pdf = Prawn::Document.new(page_size: [200,480], margin: [10, 5, 5, 5])
    pdf.image Rails.root.join('app','assets','images','logo','logobw.jpg'), scale: 0.2, :position => :center
    pdf.draw_text 'Your Order No : ', at: [40, 370], size: 8
    pdf.fill_color 'ff6bc2'
    pdf.draw_text transfer_key, at: [120, 370], size: 8
    pdf.fill_color '505050'
    pdf.draw_text commit_to_buy_at, at: [45, 360], size: 8
    pdf.stroke do
      pdf.fill_color '505050'
      pdf.horizontal_line(5, 190, at: 350)
    end
    pdf.fill_color '505050'
    pdf.draw_text 'qty', at: [5, 340], size: 8
    pdf.draw_text 'menu item', at: [20, 340], size: 8
    pdf.draw_text 'price', at: [120, 340], size: 8
    pdf.draw_text 'sub total', at: [150, 340], size: 8
    pdf.stroke do
      pdf.fill_color '505050'
      pdf.horizontal_line(5, 190, at: 330)
    end
    change_line = 0
    order_detail.each do |od|
      pdf.fill_color '505050'
      pdf.draw_text od.quantity.to_s, at: [5, 320 - change_line], size: 8
      pdf.draw_text od.menu_item.name, at: [20, 320 - change_line], size: 8
      pdf.draw_text od.menu_item.price.to_s, at: [120, 320 - change_line], size: 8
      pdf.draw_text (od.menu_item.price * od.quantity).to_s, at: [150, 320 - change_line], size: 8
      change_line += 8
    end
    pdf.stroke do
      pdf.fill_color '505050'
      pdf.horizontal_line(5, 190, at: 120)
    end
    pdf.draw_text 'delivery :', at: [120, 105], size: 8
    pdf.draw_text '30,000', at: [150, 105], size: 8
    pdf.draw_text 'total :', at: [120, 90], size: 8
    pdf.draw_text (total + 30000).to_s, at: [150, 90], size: 8
    pdf.render_file "receipts/receipt.pdf"
  end

end