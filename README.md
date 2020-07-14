# 종근당 천관보 브랜드 랜딩페이지 ( Cheonkwanbo-brand )


## 목적

웹 광고를 통한 상담신청 DB를 수집하기 랜딩페이지


## 설명

* spring-mobile-device 라이브러리를 사용하여 Intercepter에서 mobile, pc 확인하여 각 페이지로 이동
* DB를 수집하는 웹사이트 외에 수집된 DB를 조회하고 다운받을 수 있는 어드민 페이지 존재
* spring boot application으로 개발 되었으며 web server nginx를 통해 무중단 배포 구성  
  자세한 내용은 [Confluence](https://echomarketing.atlassian.net/wiki/spaces/MICROSITE/pages/344096813/cheonkwanbo-mall) 참조.


## 로직 이슈
* 고객 정보 수집 중복 처리
  24시간을 넘기지 않고 db를 남기는 사용자에게 메세지 표시 및 해당 정보 저장 안함.
  2개월동안에 추가 db를 남기는 사용자의 경우 데이터를 저장 하나  별도 중복임을 표시.
* 특정 이름 제외
  "테스트" 라는 이름으로 db를 남길경우 중복 필터에 걸리지 않고 무제한으로 저장 가능.


## 기술 스텍

- 개발 언어 및 프레임웍/라이브러리
    - java 1.8
    - springboot 2.1.4.RELEASE
    - lombok
    - junit5 5.3.2
    - spring-mobile-device 1.1.5.RELEASE
    - jstl
    - spring-security
    - BCryptPasswordEncoder
    - mybatis

- 서비스 운영 환경
    - gradle	
    - jenkins
    - ncp (네이버 클라우드)
    - nginx
    - embed tomcat
    


## 로컬 실행 방법 (test)

* jvm 옵션설정 실행
* nginx 를 사용하여 실행 하려면 nginx 설치 필요
* preferIPv4Stack ip 수집을 하기때문에 Ipv4 방식으로 수집 될 수 있도록 옵션 추가
```
-Dspring.profiles.active=dev -Djava.net.preferIPv4Stack=true -Dserver.port=8086
``` 


## 빌드 배포

* jenkins 사용 [https://ci.echoss.io/view/ckdhc(%EC%A2%85%EA%B7%BC%EB%8B%B9%EA%B1%B4%EA%B0%95)/](https://ci.echoss.io/view/ckdhc(%EC%A2%85%EA%B7%BC%EB%8B%B9%EA%B1%B4%EA%B0%95)//)

* dev
```
 name : cheonkwanbo-brand-dev
 Build with Parameters : dev
```

* production
```
 name : cheonkwanbo-brand-prod
 Build with Parameters : prod
```


