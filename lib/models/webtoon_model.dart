class WebtoonModel {
  final String title, thumb, id;

//1. mainInfo(취향껏 작명 -> but, fromJson 이라는 이름을 많이들 씀) 라는 named Constructor를 만듬
//2. 객체를 받아서 객체 하나하나를 el이라고 이름 붙임
//3. el의 정보를 가지고 위에 선언한 변수들의 값을 초기화 시켜줌
  WebtoonModel.mainInfo(Map<String, dynamic> el)
      : title = el['title'],
        thumb = el['thumb'],
        id = el['id'];
}
