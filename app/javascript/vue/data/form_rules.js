import i18n from '@/lib/i18n.js'

console.log(i18n)

const rules = {
  "stylist": {
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
  }
}

export default rules