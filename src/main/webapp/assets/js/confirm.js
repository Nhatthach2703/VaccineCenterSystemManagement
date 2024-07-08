const inputs = document.querySelectorAll('.otp-card-inputs input');
const button = document.querySelector('.otp-card button');
const verificationButton = document.querySelector('.verification');
verificationButton.addEventListener('click', handleVerification);

inputs.forEach((input, index) => {
    input.addEventListener('input', (e) => {
        const currentElement = e.target;
        const nextElement = inputs[index + 1];
        const prevElement = inputs[index - 1];

        // Chỉ cho phép nhập số và giới hạn 1 ký tự
        currentElement.value = currentElement.value.replace(/[^0-9]/g, '').slice(0, 1);

        if (currentElement.value) {
            if (nextElement) {
                nextElement.removeAttribute('disabled');
                nextElement.focus();
            }
        }

        const isAllDigitsEntered = Array.from(inputs).every(input => input.value);
        if (isAllDigitsEntered) {
            button.removeAttribute('disabled');
            button.classList.add('active');
        } else {
            button.setAttribute('disabled', true);
            button.classList.remove('active');
        }
    });

    input.addEventListener('keydown', (e) => {
        const currentElement = e.target;
        const prevElement = inputs[index - 1];

        if (e.key === 'Backspace' && !currentElement.value && prevElement) {
            prevElement.focus();
        }
    });
});

function handleVerification() {
    // Check if the verification process is successful (simulated here)
    const isVerificationSuccessful = true;

    if (isVerificationSuccessful) {
        // Show the success message container
        const successMessageContainer = document.querySelector('.otp-card1');
        successMessageContainer.style.pointerEvents; // Make it visible
        successMessageContainer.classList.add('show-success');

        // Optionally, hide the confirmation card
        const confirmationCard = document.querySelector('.otp-card');
        confirmationCard.style.opacity = 0; // Hide the card
        confirmationCard.style.pointerEvents = 'none'; // Disable interaction
    } else {
        // Handle unsuccessful verification (display error message, etc.)
    }
}