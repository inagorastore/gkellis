import axios from 'axios';

const setupBodyTrixImageUpload = () => {
    const editor = document.querySelector('trix-editor[input="body-editor"]');
    if (!editor) {
        return;
    }

    const uploadUrl = editor.dataset.uploadUrl;
    if (!uploadUrl) {
        return;
    }

    editor.addEventListener('trix-attachment-add', (event) => {
        const { attachment } = event;
        if (!attachment.file) {
            return;
        }

        event.preventDefault();

        const formData = new FormData();
        formData.append('image', attachment.file);

        axios.post(uploadUrl, formData, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        })
            .then(({ data }) => {
                attachment.setAttributes({
                    url: data.url,
                    href: data.url,
                });
            })
            .catch(() => {
                attachment.remove();
                window.alert('Η μεταφόρτωση της εικόνας απέτυχε. Δοκιμάστε ξανά.');
            });
    });
};

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupBodyTrixImageUpload);
} else {
    setupBodyTrixImageUpload();
}
