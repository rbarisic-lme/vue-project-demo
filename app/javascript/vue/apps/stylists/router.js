import VueRouter from 'vue-router'

import RootPage from '@/apps/stylists/views/RootPage'
import InfoPage from '@/apps/stylists/views/InfoPage'
import PersonalInfoView from '@/apps/stylists/views/info/PersonalInfo'
import MyServiceView from '@/apps/stylists/views/info/MyService'
import CompanyDataView from '@/apps/stylists/views/info/CompanyData'
import BankAccountView from '@/apps/stylists/views/info/BankAccount'
import VerificationView from '@/apps/stylists/views/info/Verification'
import SkillsView from '@/apps/stylists/views/info/Skills'
import ChecklistView from '@/apps/stylists/views/info/Checklist'

const router = new VueRouter({
  mode: 'history',
  base: '/stylists',
  routes: [
    {path: '/info', component: InfoPage, meta: { requiresAuth: true }, children: [
      {path: 'profile/personal-information', component: PersonalInfoView},
      {path: 'profile/my-service', component: MyServiceView},
      {path: 'business/company-data', component: CompanyDataView},
      {path: 'business/bank-account', component: BankAccountView},
      {path: 'business/verification', component: VerificationView},
      {path: 'skills', component: VerificationView},
      {path: 'checklist', component: VerificationView},
    ]},
    {path: '*', component: RootPage},
  ]
});

export default router;
