require 'etsy'
Etsy.protocol = "https"
Etsy.api_key = '2xclt98cag29cu88j8orwtzb'
Etsy.api_secret = 'old9tp2ufv'
request = Etsy.request_token
Etsy.verification_url
access = Etsy.access_token(request.token, request.secret, '1a3b6e0a')
user = Etsy.myself(access.token, access.secret)

auth = {:access_token=>access.token,:access_secret=>access.secret}

receipts = Etsy::Receipt.find_all_by_shop_id_and_status(user.shop.id, 'open', auth)

receipts.first.transactions