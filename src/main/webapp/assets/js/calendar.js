document.addEventListener('DOMContentLoaded', function () {
    const yearSelect = document.getElementById('year');
    const weekSelect = document.getElementById('week');

    // Thêm sự kiện khi thay đổi năm
    yearSelect.addEventListener('change', function () {
        updateWeeks();
    });

    // Thêm sự kiện khi thay đổi tuần
    weekSelect.addEventListener('change', function () {
        updateDates();
    });

    // Khởi tạo danh sách năm
    initializeYearSelect();

    // Mặc định chọn năm hiện tại khi tải trang
    const currentYear = new Date().getFullYear();
    yearSelect.value = currentYear;

    // Cập nhật tuần và ngày khi tải trang
    updateWeeks();
});

function initializeYearSelect() {
    const yearSelect = document.getElementById('year');
    const currentYear = new Date().getFullYear();
    const startYear = currentYear - 2;
    const endYear = currentYear + 2;

    // Tạo danh sách các năm từ năm hiện tại trở lại 2 năm và tiến 2 năm
    for (let year = startYear; year <= endYear; year++) {
        const option = document.createElement('option');
        option.value = year;
        option.textContent = year;
        yearSelect.appendChild(option);
    }
}

function updateWeeks() {
    const yearSelect = document.getElementById('year');
    const weekSelect = document.getElementById('week');
    const selectedYear = yearSelect.value;

    // Xóa các tùy chọn tuần cũ
    while (weekSelect.firstChild) {
        weekSelect.removeChild(weekSelect.firstChild);
    }

    // Thêm tùy chọn mặc định cho tuần
    const defaultOption = document.createElement('option');
    defaultOption.value = "";
    defaultOption.textContent = "--Tuần--";
    weekSelect.appendChild(defaultOption);

    if (!selectedYear) {
        updateDates(); // Cập nhật ngày cho tuần hiện tại nếu không có năm nào được chọn
        return;
    }

    // Lấy danh sách các tuần trong năm được chọn
    const weeks = getWeeksInYear(selectedYear);

    // Thêm tất cả các tuần vào dropdown
    weeks.forEach((week, index) => {
        const option = document.createElement('option');
        option.value = index + 1;
        option.textContent = `Tuần ${index + 1}: ${week.start} - ${week.end}`;
        weekSelect.appendChild(option);
    });

    // Mặc định chọn tuần hiện tại nếu không có tuần nào được chọn
    const today = new Date();
    const currentWeekIndex = getWeekIndex(today, weeks);
    weekSelect.value = currentWeekIndex + 1;

    updateDates(); // Cập nhật ngày cho tuần hiện tại
}

function updateDates() {
    const yearSelect = document.getElementById('year');
    const weekSelect = document.getElementById('week');
    const selectedYear = yearSelect.value;
    const selectedWeek = weekSelect.value;

//    const daysOfWeek = ['Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy', 'Chủ Nhật'];

    // Nếu không có năm hoặc tuần nào được chọn, mặc định hiển thị tuần hiện tại
    if (!selectedYear || !selectedWeek) {
        displayDefaultWeek();
        return;
    }

    // Lấy danh sách các tuần trong năm được chọn
    const weeks = getWeeksInYear(selectedYear);
    const week = weeks[selectedWeek - 1];
    let startDate = new Date(week.start.split('/').reverse().join('-'));

    // Kiểm tra xem tuần được chọn có bắt đầu từ thứ Hai hay không
    const startDayOfWeek = new Date(startDate).getDay();
    if (startDayOfWeek !== 1) {
        // Nếu tuần không bắt đầu từ thứ Hai, điều chỉnh để bắt đầu từ thứ Hai
        startDate.setDate(startDate.getDate() + (1 - (startDayOfWeek === 0 ? 7 : startDayOfWeek)));
    }
    // Lọc các ngày được in ra cho đúng tuần

    // Cập nhật các ngày trong tuần trên bảng
    const dayElements = document.querySelectorAll('.week span');
    dayElements.forEach((dayElement, index) => {
        const date = new Date(startDate);
        date.setDate(startDate.getDate() + index);
        dayElement.textContent = ` ${formatDate(date)}`;
    });

    // Cập nhật các giờ hẹn trong ngày
}

function displayDefaultWeek(daysOfWeek) {
    const today = new Date();
    const dayOfWeek = today.getDay();
    const startOfWeek = new Date(today);
    startOfWeek.setDate(today.getDate() - (dayOfWeek === 0 ? 6 : dayOfWeek - 1));

    const dayElements = document.querySelectorAll('.week span');
    dayElements.forEach((dayElement, index) => {
        const date = new Date(startOfWeek);
        date.setDate(startOfWeek.getDate() + index);
        dayElement.textContent = `${daysOfWeek[index]}, ${formatDate(date)}`;
    });

    // Hiển thị các giờ hẹn mặc định cho tuần hiện tại
    displayDefaultAppointments();
}

function displayDefaultAppointments() {
    const timeSlots = document.querySelectorAll('.time_tr');
    timeSlots.forEach(timeSlot => {
        const slots = timeSlot.querySelectorAll('td');
        slots.forEach(slot => {
            slot.textContent = 'Free'; // Đặt trạng thái là Free mặc định
        });
    });
}

function getWeeksInYear(year) {
    const weeks = [];
    let date = new Date(year, 0, 1);

    while (date.getDay() !== 1) {
        date.setDate(date.getDate() + 1);
    }

    while (date.getFullYear() === parseInt(year)) {
        const weekStart = new Date(date);
        const weekEnd = new Date(date);
        weekEnd.setDate(weekEnd.getDate() + 6);

        if (weekEnd.getFullYear() !== parseInt(year)) {
            weekEnd.setFullYear(year);
            weekEnd.setMonth(11);
            weekEnd.setDate(31);
        }

        weeks.push({
            start: formatDate(weekStart),
            end: formatDate(weekEnd),
        });

        date.setDate(date.getDate() + 7);
    }

    return weeks;
}

function formatDate(date) {
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    return `${day}/${month}/${year}`;
}

function getWeekIndex(date, weeks) {
    // Tìm tuần hiện tại trong danh sách các tuần
    for (let i = 0; i < weeks.length; i++) {
        const start = new Date(weeks[i].start.split('/').reverse().join('-'));
        const end = new Date(weeks[i].end.split('/').reverse().join('-'));

        if (date >= start && date <= end) {
            return i;
        }
    }

    // Nếu không tìm thấy, trả về tuần đầu tiên
    return 0;
}
