import { Controller } from "@hotwired/stimulus";
import Swiper from "swiper/bundle";
import "swiper/css/bundle";

export default class extends Controller {
  connect() {
    document.addEventListener("DOMContentLoaded", function () {
      var swiperMain = new Swiper(".mySwiper", {
        loop: true, // ループ設定
        spaceBetween: 10,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        thumbs: {
          swiper: swiperThumbs,
        },
      });

      var swiperThumbs = new Swiper(".myThumbs", {
        loop: true,
        spaceBetween: 10,
        slidesPerView: 8, // サムネイルの数
        watchSlidesProgress: true,
      });

      swiperMain.controller.control = swiperThumbs;
      swiperThumbs.controller.control = swiperMain;
    });
  }
}
