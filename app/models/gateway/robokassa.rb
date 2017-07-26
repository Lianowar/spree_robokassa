class Gateway::Robokassa < Spree::Gateway
  preference :password1, :string
  preference :password2, :string
  preference :mrch_login, :string

  attr_accessor :preferred_password1, :preferred_password2, :preferred_mrch_login


  def preferred_password1
    self.options[:password1]
  end

  def preferred_password2
    self.options[:password2]
  end

  def preferred_mrch_login
    self.options[:mrch_login]
  end

  def preferred_password1=(val)
    self.preferences[:password1] = val
  end

  def preferred_password2=(val)
    self.preferences[:password2] = val
  end

  def preferred_mrch_login=(val)
    self.preferences[:mrch_login] = val
  end


  def provider_class
    self.class
  end

  def method_type
    "robokassa"
  end

  def test?
    options[:test_mode] == true
  end

  def url
    "http://auth.robokassa.ru/Merchant/Index.aspx"
  end
  
  def self.current
    self.where(:type => self.to_s, :active => true).first
  end

  def desc
    "<p>
      <label> #{I18n.t('robokassa.success_url')}: </label> http://[domain]/gateway/robokassa/success<br />
      <label> #{I18n.t('robokassa.result_url')}: </label> http://[domain]/gateway/robokassa/result<br />
      <label> #{I18n.t('robokassa.fail_url')}: </label> http://[domain]/gateway/robokassa/fail<br />
    </p>"
  end
end
