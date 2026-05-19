import axios from 'axios';

const uploadBodyImage = (editor, file) => {
    const uploadUrl = editor.dataset.uploadUrl;
    if (!uploadUrl || !file) {
        return Promise.reject();
    }

    const formData = new FormData();
    formData.append('image', file);

    return axios.post(uploadUrl, formData, {
        headers: {
            'Content-Type': 'multipart/form-data',
        },
    });
};

const insertImageAttachment = (editor, file, url) => {
    const attachment = new window.Trix.Attachment({
        file,
        url,
        contentType: file.type,
    });

    editor.editor.insertAttachment(attachment);
};

const setupBodyTrixImageUpload = () => {
    const editor = document.querySelector('trix-editor[input="body-editor"]');
    if (!editor) {
        return;
    }

    const uploadUrl = editor.dataset.uploadUrl;
    if (!uploadUrl) {
        return;
    }

    const uploadButton = document.getElementById('body-image-upload-button');
    const fileInput = document.getElementById('body-image-file-input');

    const handleImageFile = (file) => {
        if (!file || !file.type.startsWith('image/')) {
            window.alert('Επιλέξτε έγκυρη εικόνα (JPG, PNG, WebP ή GIF).');
            return;
        }

        uploadBodyImage(editor, file)
            .then(({ data }) => {
                insertImageAttachment(editor, file, data.url);
            })
            .catch(() => {
                window.alert('Η μεταφόρτωση της εικόνας απέτυχε. Δοκιμάστε ξανά.');
            });
    };

    uploadButton?.addEventListener('click', () => {
        fileInput?.click();
    });

    fileInput?.addEventListener('change', () => {
        const file = fileInput.files?.[0];
        if (file) {
            handleImageFile(file);
        }
        fileInput.value = '';
    });

    editor.addEventListener('trix-attachment-add', (event) => {
        const { attachment } = event;
        if (!attachment.file) {
            return;
        }

        event.preventDefault();

        uploadBodyImage(editor, attachment.file)
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
