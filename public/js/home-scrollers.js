(() => {
    const initHorizontalScroller = (config) => {
        const row = document.getElementById(config.rowId);
        const leftButton = document.getElementById(config.leftButtonId);
        const rightButton = document.getElementById(config.rightButtonId);
        const swipeHint = document.getElementById(config.hintId);

        if (!row || !leftButton || !rightButton) {
            return;
        }

        const syncMobileUi = () => {
            const isMobile = window.matchMedia('(max-width: 980px)').matches;
            if (swipeHint) {
                swipeHint.style.display = isMobile ? 'block' : 'none';
            }
            leftButton.style.display = isMobile ? 'none' : 'inline-block';
            rightButton.style.display = isMobile ? 'none' : 'inline-block';
        };

        const scrollStep = () => Math.max(320, Math.round(row.clientWidth * 0.85));
        row.style.cursor = 'grab';

        let isDragging = false;
        let dragStartX = 0;
        let dragStartScrollLeft = 0;

        row.addEventListener('mousedown', (event) => {
            isDragging = true;
            dragStartX = event.pageX;
            dragStartScrollLeft = row.scrollLeft;
            row.style.cursor = 'grabbing';
        });

        row.addEventListener('mousemove', (event) => {
            if (!isDragging) {
                return;
            }

            event.preventDefault();
            const delta = event.pageX - dragStartX;
            row.scrollLeft = dragStartScrollLeft - delta;
        });

        const stopDragging = () => {
            if (!isDragging) {
                return;
            }

            isDragging = false;
            row.style.cursor = 'grab';
        };

        row.addEventListener('mouseleave', stopDragging);
        row.addEventListener('mouseup', stopDragging);

        leftButton.addEventListener('click', () => {
            row.scrollBy({ left: -scrollStep(), behavior: 'smooth' });
        });

        rightButton.addEventListener('click', () => {
            row.scrollBy({ left: scrollStep(), behavior: 'smooth' });
        });

        syncMobileUi();
        window.addEventListener('resize', syncMobileUi);
    };

    initHorizontalScroller({
        rowId: 'media-row',
        leftButtonId: 'media-scroll-left',
        rightButtonId: 'media-scroll-right',
        hintId: 'media-swipe-hint',
    });

    initHorizontalScroller({
        rowId: 'posts-row',
        leftButtonId: 'posts-scroll-left',
        rightButtonId: 'posts-scroll-right',
        hintId: 'posts-swipe-hint',
    });
})();
