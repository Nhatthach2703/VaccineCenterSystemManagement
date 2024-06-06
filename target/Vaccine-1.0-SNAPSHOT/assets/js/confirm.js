const inputs = document.querySelectorAll('.otp-card-inputs input');
const button = document.querySelector('.otp-card button');
const verificationButton = document.querySelector('.verification');
verificationButton.addEventListener('click', handleVerification);

inputs.forEach(input => {
    let lastInputStatus = 0;
    input.onkeyup = (e) => {
        const currentElement = e.target;
        const nextElement = input.nextElementSibling;
        const prevElement = input.previousElementSibling;

        if (nextElement && nextElement.hasAttribute("disabled") && currentElement.value !== "") {
            nextElement.removeAttribute("disabled");
            nextElement.focus();
        }

        if (prevElement && e.keyCode === 8) {
            button.setAttribute('disabled', true);
            button.classList.remove('active');
            lastInputStatus = 1;
        } else {
            const reg = /^[0-9]+$/;
            if (!reg.test(currentElement.value)) {
                currentElement.value = currentElement.value.replace(/\D/g, '');
            } else if (currentElement.value) {
                if (nextElement) {
                    nextElement.focus();
                } else if (lastInputStatus === 1) {
                    prevElement.value = '';
                    prevElement.focus();
                }

                const isAllDigitsEntered = inputs.every(input => input.value);
                if (isAllDigitsEntered) {
                    button.removeAttribute('disabled');
                    button.classList.add('active'); // Add 'active' class
                } else if (lastInputStatus === 1) {
                    button.setAttribute('disabled', true);
                    button.classList.remove('active');
                    button.classList.add('disabled'); // Add 'disabled' class
                } else {
                    button.classList.remove('disabled'); // Remove 'disabled' class
                }
            }
        }
    };
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