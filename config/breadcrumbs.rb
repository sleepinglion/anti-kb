crumb :root do
  link t(:home), root_path
end

crumb :reports do
   link t('activerecord.models.report'), reports_path
end

crumb :report do |report|
   link report.title, report_path(report)
   parent :faqs
end

crumb :compliments do
   link t('activerecord.models.compliment'), compliments_path
end

crumb :compliment do |compliment|
   link compliment.title, compliment_path(compliment)
   parent :compliments
end

crumb :proposes do
   link t('activerecord.models.propose'), proposes_path
end

crumb :models do
   link t('activerecord.models.model'), models_path
end

crumb :galleries do
   link t('activerecord.models.gallery'), galleries_path
end

crumb :gallery do |gallery|
   link gallery.title, gallery_path(gallery)
   parent :galleries
end

crumb :questions do
   link t('activerecord.models.question'), questions_path
end

crumb :question do |question|
   link question.title, question_path(question)
   parent :questions
end

crumb :guest_books do
   link t('activerecord.models.guest_book'), guest_books_path
end

crumb :guest_book do |guest_book|
   link guest_book.title, guest_book_path(guest_book)
   parent :guest_books
end

crumb :faqs do
   link t('activerecord.models.faq'), faqs_path
end

crumb :faq do |faq|
   link faq.title, faq_path(faq)
   parent :faqs
end

crumb :notices do
   link t('activerecord.models.notice'), notices_path
end

crumb :notice do |notice|
   link notice.title, notice_path(notice)
   parent :notices
end
