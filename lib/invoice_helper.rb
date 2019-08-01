module InvoiceHelper

  def self.update_invoice(invoice,txid,notification)
    invoice.update(
      invoice_status: 'paid',
      txid: txid,
      blokio_notification_id: notification
    )
    EmailNotification.send_notification(invoice)
  end

end
