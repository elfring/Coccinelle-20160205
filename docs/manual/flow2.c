int main(void)
{
	int ret, a = 2;

	a = foo(a);
	ret = bar(a);
	if (a)
		c();

	return ret;
}
