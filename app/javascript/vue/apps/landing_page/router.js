import VueRouter from 'vue-router'

import LandingPage from '@/apps/landing_page/views/LandingPage'
import StaticPage from '@/apps/landing_page/views/StaticPage'
import BecomeAStylistPage from '@/apps/landing_page/views/BecomeAStylistPage'
import StylistProfilePage from '@/apps/landing_page/views/StylistProfilePage'

const router = new VueRouter({
  mode: 'history',
  base: '/',
  routes: [
    // {path: '/info', component: InfoPage, meta: { requiresAuth: true }, children: [
      // {path: 'profile/personal-information', component: PersonalInfoView},
    // ]},
    {path: '/imprint', component: StaticPage, props: {name: 'imprint'}},
    {path: '/terms', component: StaticPage, props: {name: 'terms'}},
    {path: '/privacy', component: StaticPage, props: {name: 'privacy'}},
    {path: '/become-a-stylist', component: BecomeAStylistPage},
    {path: '/profiles/:md5_digest', component: StylistProfilePage},
    {path: '*', component: LandingPage},
  ]
});

export default router;
