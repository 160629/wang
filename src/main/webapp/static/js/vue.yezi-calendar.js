Vue.component('yezi-calendar-component', {
    template: '#calendarTemplate',
    props: ['checkInDate', 'checkOutDate'],
    data: function () {
        return {
            calendar: null,
            num: 0,
            LeftCalendar: null,
            RightCalendar: null,

            firstDate: null,
            lastDate: null,
            isChosed: false,
            isReset: false
        }
    },
    created: function () {
        if (this.checkInDate) {
            var chi = this.checkInDate.split('-');
            var chiYear = parseInt(chi[0]);
            var chiMonth = parseInt(chi[1]) - 1;
            var chiDay = parseInt(chi[2]);
            this.firstDate = new Date(chiYear, chiMonth, chiDay);
        }
        if (this.checkOutDate) {
            var cho = this.checkOutDate.split('-');
            var choYear = parseInt(cho[0]);
            var choMonth = parseInt(cho[1]) - 1;
            var choDay = parseInt(cho[2]);
            this.lastDate = new Date(choYear, choMonth, choDay);
        }
        this.cloneCalendar();
    },
    methods: {
        cloneCalendar: function () {
            this.calendar = cqDate.getYeziCalendar(this.num);
            var leftCalendar = this.cloneObj(this.calendar.Left);
            this.setDay(leftCalendar.Days);
            var rightCalendar = this.cloneObj(this.calendar.Right);
            this.setDay(rightCalendar.Days);
            this.LeftCalendar = leftCalendar;
            this.setSelect(0, this.LeftCalendar);
            this.RightCalendar = rightCalendar;
            this.setSelect(1, this.RightCalendar);
        },
        setDay: function (days) {
            for (var i = 0; i < days.length; i++) {
                var day = days[i];
                day.IsInday = false;
                day.IsOutday = false;
                day.IsChosed = false;
            }
            var firstWeek = days[0].Week;
            var length = 0;
            if (firstWeek > 0) {
                length = firstWeek;
            }
            for (var i = 0; i < length; i++) {
                days.unshift({
                    Day: '',
                    Week: '',
                    IsToday: false,
                    IsInday: false,
                    IsChosed: false,
                    IsOutday: false
                });
            }
        },
        setSelect: function (p, calendar) {
            var currDate = new Date(calendar.Year, calendar.Month - 1, 1);
            if (this.firstDate && this.lastDate && p == 0 &&
                this.firstDate < currDate && this.lastDate > currDate) {
                this.isChosed = true;
            }
            for (var i = 0; i < calendar.Days.length; i++) {
                var day = calendar.Days[i];
                day.IsInday = false;
                day.IsOutday = false;
                day.IsChosed = false;
                if (this.firstDate &&
                    calendar.Year == this.firstDate.getFullYear() &&
                    calendar.Month == this.firstDate.getMonth() + 1 &&
                    day.Day == this.firstDate.getDate()) {
                    day.IsInday = true;
                    this.isChosed = true;
                }
                if (this.isChosed && !this.isReset) {
                    day.IsChosed = true;
                }
                if (this.lastDate &&
                    calendar.Year == this.lastDate.getFullYear() &&
                    calendar.Month == this.lastDate.getMonth() + 1 &&
                    day.Day == this.lastDate.getDate()) {
                    day.IsOutday = true;
                    this.isChosed = false;
                }
            }
        },
        onPrev: function () {
            this.num = -1;
            this.isChosed = false;
            this.cloneCalendar();
        },
        onNext: function () {
            this.num = 1;
            this.isChosed = false;
            this.cloneCalendar();
        },
        onSelect: function (year, month, day) {
            if ($.isNumeric(day)) {
                var ondate = new Date(year, month - 1, day);
                if (this.isReset) {
                    if (ondate < this.firstDate) {
                        this.lastDate = this.firstDate;
                        this.firstDate = ondate;
                    } else {
                        this.lastDate = ondate;
                    }
                    this.isReset = false;
                    $(".timePickers").toggle();
                } else {
                    this.firstDate = ondate;
                    this.lastDate = null;
                    this.isReset = true;
                }
                this.isChosed = false;
                this.setSelect(0, this.LeftCalendar);
                this.setSelect(1, this.RightCalendar);
                this.$emit("listen-checkin-event", this.firstDate.format("yyyy-MM-dd"));
                var checkoutDate = '';
                if (this.lastDate) {
                    checkoutDate = this.lastDate.format("yyyy-MM-dd");
                }
                this.$emit("listen-checkout-event", checkoutDate);
            }
        },
        cloneObj: function (obj) {
            var str, newobj = obj.constructor === Array ? [] : {};
            if (typeof obj !== 'object') {
                return;
            } else if (window.JSON) {
                str = JSON.stringify(obj), //序列化对象
                    newobj = JSON.parse(str); //还原
            } else {
                for (var i in obj) {
                    newobj[i] = typeof obj[i] === 'object' ? cloneObj(obj[i]) : obj[i];
                }
            }
            return newobj;
        }
    },
    watch: {}
});
