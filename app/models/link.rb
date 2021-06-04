class Link < ApplicationRecord
	belongs_to :user

  validates :unique_id,
    presence: true,
    length: { minimum: 4, maximum: 16 },
    format: {with: /\A[0-9a-zA-Z]+\z/i }

	validates_format_of :link01_url, :allow_blank => true, with: /\A#{URI::regexp(%w(http https))}\z/
	validates_format_of :link01_url, :allow_blank => true, without: /\A(http|https):\/\/bit.ly/
	validates_format_of :link02_url, :allow_blank => true, with: /\A#{URI::regexp(%w(http https))}\z/
	validates_format_of :link02_url, :allow_blank => true, without: /\A(http|https):\/\/bit.ly/
	validates_format_of :link03_url, :allow_blank => true, with: /\A#{URI::regexp(%w(http https))}\z/
	validates_format_of :link03_url, :allow_blank => true, without: /\A(http|https):\/\/bit.ly/
	validates_format_of :link04_url, :allow_blank => true, with: /\A#{URI::regexp(%w(http https))}\z/
	validates_format_of :link04_url, :allow_blank => true, without: /\A(http|https):\/\/bit.ly/
	validates_format_of :link05_url, :allow_blank => true, with: /\A#{URI::regexp(%w(http https))}\z/
	validates_format_of :link05_url, :allow_blank => true, without: /\A(http|https):\/\/bit.ly/

end
