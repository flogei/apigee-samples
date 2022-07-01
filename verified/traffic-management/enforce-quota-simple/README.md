# Set a quota on the proxy

Enforces a quota on the number of requests made to a proxy. When the number exceeds the quota, requests are refused and the proxy returns a fault message.

With a quota, you can limit the number of API calls in a given period of time. For example, you might offer fee-based quota levels to developers. You can associate quota levels with API Products, for example. A developer might pay a higher fee to obtain an API key associated with a Product that has a higher quota.

### What's interesting about this sample

* A Quota policy limits requests to 1 per minute.

 This policy specifies that no more than one request per minute may be satisfied. For requests beyond one per minute, a fault is returned.

```xml
<Quota name="EnforceQuota">
      <DisplayName>Enforce Quota</DisplayName>
      <FaultRules/>
      <Properties/>
      <Interval>1</Interval>
      <TimeUnit>minute</TimeUnit>
      <Allow count="1"/>
</Quota>
```

### Extra reading: important terms and concepts

* [**Quota policy**](http://docs.apigee.com/api-services/reference/quota-policy) enforces a limit on the number of API calls that can be made in an interval of time. 
* **Quota-specific flow variables** are set automatically when the Verify API Key policy executes successfully. They reflect the values set in the Product associated with an API key.