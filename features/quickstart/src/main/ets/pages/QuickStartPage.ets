import {EnablementView} from '../view/EnablementView';
import {TutorialView} from '../view/TutorialView';
import {Banner} from '../view/Banner';
import { ArticleDetailPage } from './ArticleDetailPage';
import { ArticleClass } from '../model/ArticleClass';
import { BannerClass } from '../model/BannerClass';
import { BannerDetailPage } from './BannerDetailPage';
import { Header } from '../view/Header';

@Component
export struct QuickStartPage {
  @State message: string = '快速入门';
  @Provide('articlePathStack') articlePathStack: NavPathStack = new NavPathStack();
  @Builder
  quickStartRouter(name: string, param?: ArticleClass | BannerClass) {
    if (name === 'articleDetail') {
      ArticleDetailPage()
    } else if (name === 'bannerDetailPage') {
      BannerDetailPage()
    }
}

  build() {
    Navigation(this.articlePathStack) {
      Column() {
        // Text(this.message)
        //   .fontSize(24)
        //   .fontWeight(700)
        //   .width('100%')
        //   .padding({'left': 16})
        //   .fontFamily('HarmonyHeiTi-Bold')
        //   .lineHeight(33)
        Header()
        Scroll() {
          Column() {
            Banner()
            EnablementView()
            TutorialView()
          }
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .align(Alignment.TopStart)

      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
    }
    .navDestination(this.quickStartRouter)
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)

  }
}



