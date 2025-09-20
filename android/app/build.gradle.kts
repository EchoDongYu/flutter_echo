plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.cashigo.rapidos"
    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.cashigo.rapidos.prestamos.app"
        minSdkVersion(flutter.minSdkVersion)
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        ndk {
            abiFilters.addAll(arrayOf("armeabi-v7a", "arm64-v8a" /*"x86", "x86_64"*/))
        }
    }

    signingConfigs {
        create("release") {
            storeFile = file("release.jks")
            storePassword = "1316451623"
            keyPassword = "1316451623"
            keyAlias = "key0"
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
