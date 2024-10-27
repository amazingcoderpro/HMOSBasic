import {BannerClass} from '../model/BannerClass';
import {bufferToString} from '../util/BufferUtil';

// @Preview
@Component
export struct Banner {
  @Consume('articlePathStack') articlePathStack: NavPathStack;
  // @State bannerList: Array<BannerClass> = [
  //   new BannerClass('pic0', $r('app.media.banner_pic0'),
  //     'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
  //   new BannerClass('pic1', $r('app.media.banner_pic1'),
  //     'https://developer.huawei.com/consumer/cn/'),
  //   new BannerClass('pic2', $r('app.media.banner_pic2'),
  //     'https://developer.huawei.com/consumer/cn/deveco-studio/'),
  //   new BannerClass('pic3', $r('app.media.banner_pic3'),
  //     'https://developer.huawei.com/consumer/cn/arkts/'),
  //   new BannerClass('pic4', $r('app.media.banner_pic4'),
  //     'https://developer.huawei.com/consumer/cn/arkui/'),
  //   new BannerClass('pic5', $r('app.media.banner_pic5'),
  //     'https://developer.huawei.com/consumer/cn/hms')
  // ];
  @State bannerList: Array<BannerClass> = [];

  fetchAndSetBannerData() {
    getContext().resourceManager.getRawFileContent('BannerData.json').then(value => {
      // buffer to str
      let res: string = bufferToString(value);
      // console.log('2222222');
      // str to struct
      this.bannerList = JSON.parse(res) as BannerClass[];
      // console.log(this.bannerList.toString());
    });
  }

  aboutToAppear(): void {
      // console.log("banner init 11111")
      this.fetchAndSetBannerData();
  }
  build() {
    Swiper() {
      //   Image($r('app.media.banner_pic1'))
      //     .objectFit(ImageFit.Contain)
      //     .width('100%')
      //     .padding({left: 16, right: 16, top: 11})
      //     .borderRadius(16)
      //
      //   Image($r('app.media.banner_pic2'))
      //     .objectFit(ImageFit.Contain)
      //     .width('100%')
      //     .padding({left: 16, right: 16, top: 11})
      //     .borderRadius(16)
      // }
      ForEach(
        this.bannerList,
        (item: BannerClass, index: number) => {
          Image($r(item.imageSrc))
            .width('100%')
            .objectFit(ImageFit.Contain)
            .padding({ left: 16, right: 16, top: 11 })
            .borderRadius(16)
            .onClick(() => {
              this.articlePathStack.pushPathByName('bannerDetailPage', item);
            })
        },
        (item: BannerClass, index: number) => item.id
      )
    }.autoPlay(true).loop(true).indicator(new DotIndicator().color('#1a000000').selectedColor('#0A59F7'))
  }
}