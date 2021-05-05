import VueRouter from 'vue-router'

import RootPage from '@/apps/users/views/RootPage.vue'

const router = new VueRouter({
  mode: 'history',
  base: '/dashboard',
  routes: [
    // {path: '/info', component: InfoPage, meta: { requiresAuth: true }, children: [
      // {path: 'profile/personal-information', component: PersonalInfoView},
      // {path: 'checklist', component: ChecklistView},
    // ]},
    // {path: '/kalender', component: CalendarPage},
    // {path: '/kalender', component: CalendarPage},
    {path: '*', component: RootPage},
  ]
});

export default router;
