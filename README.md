# capacitor-gps-enable-ios

ios location permission

## Install

```bash
npm install capacitor-gps-enable-ios
npx cap sync
```

## API

<docgen-index>

* [`requestPermissions()`](#requestpermissions)
* [`addListener('cancelAction' | 'locationStatusChange' | 'mockLocationDetected', ...)`](#addlistenercancelaction--locationstatuschange--mocklocationdetected-)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### requestPermissions()

```typescript
requestPermissions() => Promise<void>
```

--------------------


### addListener('cancelAction' | 'locationStatusChange' | 'mockLocationDetected', ...)

```typescript
addListener(eventName: 'cancelAction' | 'locationStatusChange' | 'mockLocationDetected', listenerFunc: (info: any) => any) => Promise<PluginListenerHandle>
```

| Param              | Type                                                                            |
| ------------------ | ------------------------------------------------------------------------------- |
| **`eventName`**    | <code>'cancelAction' \| 'locationStatusChange' \| 'mockLocationDetected'</code> |
| **`listenerFunc`** | <code>(info: any) =&gt; any</code>                                              |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt;</code>

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |

</docgen-api>
