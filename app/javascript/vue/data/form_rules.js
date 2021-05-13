import i18n from '@/lib/i18n.js'

let emailRegex = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/

const rules = {
  "basic": {
    "presence": [
      value => !!value || i18n.t('form.error.missing'),
    ]
  },
  "stylist": {
    "email": [
      value => !!value || i18n.t('form.error.missing'),
      value => (value || '').match(emailRegex) ? true : false || i18n.t('form.error.email_mismatch')
    ],
    "password": [
      value => !!value || i18n.t('form.error.missing'),
      value => (value || '').length >= 8 || i18n.t('form.error.passsword_too_short'),
    ],
    "first_name": [
      value => !!value || i18n.t('form.error.missing'),
    ],
    "last_name": [
      value => !!value || i18n.t('form.error.missing'),
    ],
    "street": [
        value => !!value || i18n.t('form.error.missing'),
        value => (value || '').length <= 150 || i18n.t('form.error.too_long', {length: 150}),
    ],
    "city": [
        value => !!value || i18n.t('form.error.missing'),
        value => (value || '').length <= 150 || i18n.t('form.error.too_long', {length: 150}),
    ],
    "zipcode": [
        value => !!value || i18n.t('form.error.missing'),
  
    ],    
    "country": [
        value => !!value || i18n.t('form.error.missing'),
    ],
    "service_package_basic_hair_price": [
      value => !!value || i18n.t('form.error.missing'),
      value => (parseFloat(value) || 0) >= 90 || i18n.t('form.error.minimum', {amount: '90€'}),
    ],
    "service_package_basic_makeup_price": [
      value => !!value || i18n.t('form.error.missing'),
      value => (parseFloat(value) || 0) >= 80 || i18n.t('form.error.minimum', {amount: '80€'}),

    ],
    "service_package_standard_price": [
      value => !!value || i18n.t('form.error.missing'),
      value => (parseFloat(value) || 0) >= 300 || i18n.t('form.error.minimum', {amount: '300€'}),
    ],
    "service_package_premium_price": [
      value => !!value || i18n.t('form.error.missing'),
      value => (parseFloat(value) || 0) >= 350 || i18n.t('form.error.minimum', {amount: '350€'}),
    ],
    "extras": [
      // value => !!value || i18n.t('form.error.missing'),
    ],
    "extra_item": [
      value => !!value || i18n.t('form.error.missing'),
      value => (parseFloat(value) || 0) >= 20 || i18n.t('form.error.minimum', {amount: '20€'}),
    ]
  },
  "bank_account": {
    "full_name": [
      value => !!value || i18n.t('form.error.missing')
    ],
    "iban": [
      value => !!value || i18n.t('form.error.missing'),
    ],
  }
}

export default rules