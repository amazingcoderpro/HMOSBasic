import { QuickStartPage } from 'quickstart';
import { CourseLearning } from 'learning';
import { KnowledgeMapPage } from 'map';
import { KnowledgeMapContent } from 'map';
import { BreakpointSystem, BreakpointTypeEnum, BreakpointType } from 'utils';

@Preview
@Entry
@Component
struct Index {
  // @State message: string = 'Hello World';
  private tabsController : TabsController = new TabsController();
  @State currentIndex: number = 0;
  private breakpointSystem: BreakpointSystem = new BreakpointSystem();
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointTypeEnum.MD;

  @Builder
  tabBarBuilder(title: string, targetIndex: number, selectedIcon: Resource, unselectIcon: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedIcon : unselectIcon)
        .width(24)
        .height(24)
      Text(title)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(10)
        .fontColor(this.currentIndex === targetIndex ? '#0A59F7' : 'rgba(0,0,0,0.60)')
        .textAlign(TextAlign.Center)
        .lineHeight(14)
        .fontWeight(500)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);
    })
  }
  build() {
    Tabs({ barPosition: this.currentBreakpoint === BreakpointTypeEnum.LG ?
      BarPosition.Start :
      BarPosition.End, controller: this.tabsController } ){
      TabContent() {
        QuickStartPage()
      }
      .tabBar(this.tabBarBuilder('快速入门', 0, $r('app.media.ic_01_on'), $r('app.media.ic_01_off')))

      TabContent() {
        CourseLearning()
      }
      .tabBar(this.tabBarBuilder('课程学习', 1, $r('app.media.ic_01_on'), $r('app.media.ic_01_off')))

      TabContent() {
        KnowledgeMapPage()
      }
      .tabBar(this.tabBarBuilder('知识地图', 2, $r('app.media.ic_01_on'), $r('app.media.ic_01_off')))
    }
    .scrollable(false)
    .vertical(this.currentBreakpoint === BreakpointTypeEnum.LG ? true : false)
    .divider({
      strokeWidth: 0.5,
      color: '#0D182431'
    })
    .backgroundColor('#F1F3F5')
    .padding({ top: 36, bottom: 28 })
  }

  aboutToAppear() {
    this.breakpointSystem.register();
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister();
  }
}