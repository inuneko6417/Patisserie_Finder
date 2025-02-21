import Swiper from 'swiper/bundle';
import 'swiper/css/bundle';

document.addEventListener('DOMContentLoaded', () => {
  const thumb = document.querySelectorAll('.gallery02 .thumb-media');

  const switchThumb = (index) => {
    document.querySelector('.gallery02 .thumb-media-active')?.classList.remove('thumb-media-active');
    thumb[index]?.classList.add('thumb-media-active');
  };

  const mySwiper = new Swiper('.gallery02 .swiper', {
    loop: false,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    on: {
      afterInit: (swiper) => {
        // 初期アクティブサムネイル設定
        if (thumb[swiper.realIndex]) {
          thumb[swiper.realIndex].classList.add('thumb-media-active');
        }

        // サムネイルクリック時にスライドを切り替え
        thumb.forEach((element, i) => {
          element.addEventListener('click', () => {
            swiper.slideTo(i);
          });
        });
      },
      slideChange: (swiper) => {
        switchThumb(swiper.realIndex);
      },
    },
  });
});

export default class GalleryController {
  connect() {
    console.log("GalleryController connected!");
  }
}
