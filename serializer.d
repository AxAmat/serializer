module serializer;

import core.stdc.stdio: FILE, fopen, fwrite, fread, fclose;

/++
    Сериализует структуру в файл
+/
void serialize(T)(T s, const(char*) filename) 
{
    FILE* fp = fopen(filename, "wb");
    const size_t ret = fwrite(&s, s.sizeof, 1, fp);
    fclose(fp);
    assert(ret == 1);
}

/++
    Дисериализует строку из файла в структуру
+/
T deserialize(T)(T s, const(char*) filename)
{
    FILE* fp = fopen(filename, "rb");
    const size_t ret = fread(&s, s.sizeof, 1, fp);
    fclose(fp);
    assert(ret == 1);
    return s;
}
