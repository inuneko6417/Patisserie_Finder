import { Controller } from "@hotwired/stimulus";
import Swiper from "swiper/bundle";
import "swiper/css/bundle";

export default class extends Controller {
  connect() {
    // サムネイルスライダーを先に初期化
    const swiperThumbs = new Swiper(".myThumbs", {
      loop: true,
      spaceBetween: 10,
      slidesPerView: 8, // サムネイルの数
      watchSlidesProgress: true,
    });

    // メインスライダーを初期化
    const swiperMain = new Swiper(".mySwiper", {
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
        swiper: swiperThumbs, // サムネイルスライダーを関連付け
      },
    });

    // スライダー間の連携（必要に応じて）
    // swiperMain.controller.control = swiperThumbs;
    // swiperThumbs.controller.control = swiperMain;
  }
}
