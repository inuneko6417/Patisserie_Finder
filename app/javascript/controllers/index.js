// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import GalleryController from "./gallery_controller"
application.register("gallery", GalleryController)

import HeaderLoginController from "./header_login_controller"
application.register("header_login", HeaderLoginController)

import HeaderController from "./header_controller"
application.register("header", HeaderController)

import LoginController from "./login_controller"
application.register("login", LoginController)
