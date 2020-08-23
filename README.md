This repository is my code for learning [Programming Languages, Part A](https://www.coursera.org/learn/programming-languages/)

```bash
docker run  -it --rm \
  -v /path/to/ProgrammingLanguagePartA:/app \
  --entrypoint sml \
  ktrueda/smlnj:latest /app/submit.sml /app/test.sml
```
