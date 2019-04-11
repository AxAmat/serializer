module serializer;

import core.stdc.stdio: FILE, fopen, fwrite, fread, fclose;

/++
    Сериализует структуру в файл
+/
void serialize(T, string)(T s, string filename) 
{
    auto fn = cast(const(char*)) filename;
    FILE* fp = fopen(fn, "wb");
    const size_t ret = fwrite(&s, s.sizeof, 1, fp);
    fclose(fp);
    assert(ret == 1);
}

/++
    Дисериализует строку из файла в структуру
+/
T deserialize(T, string)(T s, string filename)
{
    auto fn = cast(const(char*)) filename;
    FILE* fp = fopen(fn, "rb");
    const size_t ret = fread(&s, s.sizeof, 1, fp);
    fclose(fp);
    assert(ret == 1);
    return s;
}
