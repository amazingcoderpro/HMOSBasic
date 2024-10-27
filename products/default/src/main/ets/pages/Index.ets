import { QuickStartPage } from 'quickstart';
import { CourseLearning } from 'learning';
import { KnowledgeMapPage } from 'map';
import { KnowledgeMapContent } from 'map';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      // QuickStartPage()
      // CourseLearning()
      KnowledgeMapPage()
    }.backgroundColor('#F1F3F5')
    .padding({ top: 36, bottom: 28 })
  }
}