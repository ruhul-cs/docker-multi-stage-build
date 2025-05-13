### Docker build Image
```sh
docker build -t <image_name>:<version> .
```

### Docker run Image
```sh
docker run -p <host_port>:<container_port>  --name <container_name> \
       --hostname <host_name> 
       --network <custom_network>
```

### Mention network While building the image:

```sh
docker build --network=host -t <image_name>:<version_name> .

```

### Docker best Practise:
- একটি application containarize করার মূল উদ্দেশ্যই হচ্ছে, application এর run time environment কে স্টেবল করা। 
আমরা যদি ডকার এর বেইজ ইমেজ এ 
FROM pyton:latest ব্যাবহার করি, তাহলে হয়ত এখন চলছে, কিন্তু কিছুদিন বা বছর পর পাইথন এর ভার্শন এর মিস ম্যাচ এর কারনে প্রজেক্ট এ আন এক্সপেক্টেড এরর দেখা দিতে পারে। তাই best practise হচ্ছে, বেইজ ইমেজ এ specific version উল্লেখ করা। 
উদাহরনঃ 
FROM node:18 

- দিন শেযে আমাদের application containarize করার মূল উদ্দেশ্য হচ্ছে, এই application কে / service কে রান করা। কিন্তু আমরা 
বেইজ ইমেজ এ হিসেবে slim ব্যাবহার না করার কারনে, আমাদের ইমেজ এর সাইজ অনেক বেড়ে যায়। যেটা এড়িয়ে যাওয়া উচিৎ তাই আমরা বেইজ ইমেজ এর স্লিম ভার্শন ব্যাবহার করব।
যেমন 
FROM node:18-slim
এই বেইজ ইমেজ এ শুধু মাত্র node.js application রান করার জন্য যা যা প্রয়োজন তাই রয়েছে। 

- আমরা অনেক সময় আমাদের dev environment এ নোডজেএস / পাইথন / লারাভেল প্রজেক্ট রান করার জন্য ডেভ ডিপেন্ডেন্সি ব্যাবহার করে থাকি। যেগুল প্রডাকশনের জন্য মোটেও প্রয়োজন নয়। যেমন nodemon, jest, test folder এ সকল ফাইল প্রডাকশন ইনভাইরনমেন্ট এ না রাখা অত্যন্ত জরুরি। এজন্য আমাদের .dockerignore ফাইল মেইন্টেইন করা উচিৎ। 

- আমরা অনেক সময় ```COPY . . ``` কমান্ড ব্যবহার করে, বড় বড় লাইব্রেরি, প্যাকেজ , SDK ইত্যাদি হোস্ট থেকে কন্টেইনার এ কপি করি, যেটি মোটেও উচিৎ নয়, এতে করে ইমেজ এর সাইজ বেড়ে যায়। তাই .dockerignore file এ এসকল প্যাকেজ যেমন node_modules  ইত্যাদি ইনক্লুড করে রাখা উচিৎ। 
এবং RUN কমান্ড ব্যবহার করে এ সকল প্রডাকশনের জন্য প্রয়োজনীয় প্যাকেজ ইন্সটল করা উচিৎ।

- আমাদের অবশ্যই এটি মাথায় রাখতে হবে যে ডকার ইমেজ এর লেয়ার যত কম হবে, ইমেজ এর সাইজ তত কম হবে। 
যেমন ঃ 
RUN apt-get update
RUN apt-get upgrade
RUN wget example.com/download
এখানে এই ইমেজ এর সাইজ significantly বেড়ে যাবে। তাই উচিৎ ঃ 
এ ধরনের কমান্ড একটি লেয়ারে লিখাঃ 
RUN apt-get update &&  apt-get upgrade && wget example.com/download

