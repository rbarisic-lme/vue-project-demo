<template lang="pug">
v-container
  v-row.fill-height
    v-col(sm="12" lg="4")
     v-sheet.px-8.py-4.mb-8(rounded elevation="2")
        h2.heading-h2.serif Kalender
        v-toolbar(flat)
          v-menu(bottom right)
            template(v-slot:activator='{ on, attrs }')
              v-btn(outlined color='grey darken-2' v-bind='attrs' v-on='on')
                span {{ typeToLabel[type] }}
                v-icon(right)
                  | mdi-menu-down
            v-list
              v-list-item(@click="type = 'day'")
                v-list-item-title Tag
              v-list-item(@click="type = 'week'")
                v-list-item-title Woche
              v-list-item(@click="type = 'month'")
                v-list-item-title Monat
          v-spacer
          v-btn.mr-4(outlined color='grey darken-2' @click='setToday')
            | Heute
        v-toolbar(flat)
          v-toolbar-title(v-if='$refs.calendar')
            | {{ $refs.calendar.title }}
          v-btn(fab text small color='grey darken-2' @click='prev')
            v-icon(small)
              | mdi-chevron-left
          v-btn(fab text small color='grey darken-2' @click='next')
            v-icon(small)
              | mdi-chevron-right
        v-toolbar(flat)
          v-toolbar-title Verfügbarkeit
        v-radio-group(mandatory v-model="radios")
          v-radio(label="Verfügbar" value="radio-1")
          v-radio(label="Geblockt" value="radio-2")
    v-col(sm="12" lg="8")
      v-sheet(height='600')
        v-calendar(ref='calendar' v-model='focus' color='primary' :events='events' :event-color='getEventColor' :type='type' @click:event='showEvent' @click:more='viewDay' @click:date='viewDay' @change='updateRange')
        v-menu(v-model='selectedOpen' :close-on-content-click='false' :activator='selectedElement' offset-x)
          v-card(color='grey lighten-4' min-width='350px' flat)
            v-toolbar(:color='selectedEvent.color' dark)
              v-btn(icon)
                v-icon mdi-pencil
              v-toolbar-title(v-html='selectedEvent.name')
              v-spacer
              v-btn(icon)
                v-icon mdi-heart
              v-btn(icon)
                v-icon mdi-dots-vertical
            v-card-text
              span(v-html='selectedEvent.details')
            v-card-actions
              v-btn(text color='secondary' @click='selectedOpen = false')
                | Cancel

</template>

<script>
 export default {
    data: () => ({
      radios: null,
      focus: '',
      type: 'month',
      typeToLabel: {
        month: 'Monat',
        week: 'Woche',
        day: 'Tag',
      },
      selectedEvent: {},
      selectedElement: null,
      selectedOpen: false,
      events: [],
      colors: ['blue', 'indigo', 'deep-purple', 'cyan', 'green', 'orange', 'grey darken-1'],
      names: [],
    }),
    mounted () {
      this.$refs.calendar.checkChange()
    },
    methods: {
      viewDay ({ date }) {
        this.focus = date
        this.type = 'day'
      },
      getEventColor (event) {
        return event.color
      },
      setToday () {
        this.focus = ''
      },
      prev () {
        this.$refs.calendar.prev()
      },
      next () {
        this.$refs.calendar.next()
      },
      showEvent ({ nativeEvent, event }) {
        const open = () => {
          this.selectedEvent = event
          this.selectedElement = nativeEvent.target
          setTimeout(() => {
            this.selectedOpen = true
          }, 10)
        }

        if (this.selectedOpen) {
          this.selectedOpen = false
          setTimeout(open, 10)
        } else {
          open()
        }

        nativeEvent.stopPropagation()
      },
      updateRange ({ start, end }) {
        const events = []

        const min = new Date(`${start.date}T00:00:00`)
        const max = new Date(`${end.date}T23:59:59`)
        const days = (max.getTime() - min.getTime()) / 86400000
        const eventCount = this.rnd(days, days + 20)

        // for (let i = 0; i < eventCount; i++) {
        //   const allDay = this.rnd(0, 3) === 0
        //   const firstTimestamp = this.rnd(min.getTime(), max.getTime())
        //   const first = new Date(firstTimestamp - (firstTimestamp % 900000))
        //   const secondTimestamp = this.rnd(2, allDay ? 288 : 8) * 900000
        //   const second = new Date(first.getTime() + secondTimestamp)

        //   events.push({
        //     name: this.names[this.rnd(0, this.names.length - 1)],
        //     start: first,
        //     end: second,
        //     color: this.colors[this.rnd(0, this.colors.length - 1)],
        //     timed: !allDay,
        //   })
        // }

        this.events = events
      },
      rnd (a, b) {
        return Math.floor((b - a + 1) * Math.random()) + a
      },
    },
  }
</script>

<style lang="scss" scoped>

</style>
