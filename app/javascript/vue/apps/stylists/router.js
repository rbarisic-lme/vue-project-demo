import VueRouter from 'vue-router'

import RootPage from '@/apps/stylists/views/RootPage'
import InfoPage from '@/apps/stylists/views/InfoPage'
import PersonalInfoView from '@/apps/stylists/views/info/PersonalInfo'

const router = new VueRouter({
  mode: 'history',
  base: '/stylists',
  routes: [
    {path: '/info', component: InfoPage, children: [
      {path: 'profile/personal-information', component: PersonalInfoView}
    ]},
    {path: '*', component: RootPage},
  ]
});

export default router;