# capacitor-gps-enable-ios

ios location permission

## Install

```bash
npm install capacitor-gps-enable-ios
npx cap sync
```

## API

<docgen-index>

* [`checkLocationStatus()`](#checklocationstatus)
* [`requestPermissions()`](#requestpermissions)
* [`dismissAlert()`](#dismissalert)
* [`addListener('cancelAction' | 'locationStatusChange' | 'mockLocationDetected', ...)`](#addlistenercancelaction--locationstatuschange--mocklocationdetected-)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### checkLocationStatus()

```typescript
checkLocationStatus() => Promise<LocationStatus>
```

**Returns:** <code>Promise&lt;<a href="#locationstatus">LocationStatus</a>&gt;</code>

--------------------


### requestPermissions()

```typescript
requestPermissions() => Promise<void>
```

--------------------


### dismissAlert()

```typescript
dismissAlert() => Promise<void>
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


#### LocationStatus

| Prop                  | Type                 |
| --------------------- | -------------------- |
| **`locationEnabled`** | <code>boolean</code> |
| **`latitude`**        | <code>number</code>  |
| **`longitude`**       | <code>number</code>  |
| **`locationChanged`** | <code>boolean</code> |
| **`message`**         | <code>string</code>  |


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |

</docgen-api>
