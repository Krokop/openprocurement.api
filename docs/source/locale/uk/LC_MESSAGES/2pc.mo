��          �               �     �  �   �  �   '  #   �  (   �       /     v   M    �     �        |     �   �  S   >  �   �  �   "  {   �  �   ?  �   $	  _   
     g
  B   x
  �  �
     �    �    �  _   �  a   Y  %   �  B   �  �   $  �  �  E   �  +   �  �   $    �  �     �   �  <  �  �   �    �  5  �  �   �  "   h  �   �   2 Phase Commit A request `POST /tenders` creates a tender in status ``draft``. As a result, an ``acc_token`` is passed for the further tender management. All tenders created in the CDB but not yet published will not be displayed on the web platform and, therefore, will not lead to their announcement. Creating tender with 2-phase commit Creating tender with single-phase commit Creation of a tender Creation of the tender in the ``draft`` status. Here is an example of incorrectly formed request. This error indicates that the data is not found in the body of JSON. In case of unsuccessful request and/or 5xx errors you should check modified object data (tender, bid, award, etc.), since 5xx error response does not necessarily guarantee that request has not been performed. You should repeat this request with some interval until successful result. Mechanism of the 2-phase commit Publication of a tender Repeating of the request for publication in case of problem with receiving a response from the server will not cause errors. Sending a single-phase request for a tender creation (POST /tenders) according to the "old" mechanism, that creates a tender already in the ``active.enquiries`` status: Tender becomes available after the successful completion of the following requests: Tender with the ``draft`` status is "invisible" in the `GET /tenders` list. Chronograph does not "see" it, therefore, does not switch statuses. The 2-phase commit provides a mechanism for CDB to publish only the tenders that clients are able to control and duplicates of which they have rights to cancel. The new mechanism is available along with the "old" one. The "old" is likely to be turned off in one of the later releases. The reason for duplicated tenders can be cases when the requester did not receive a response from the server about tender creation and, therefore, repeated the request. Removing such tenders requires administrative intervention. The request `PATCH /tenders/{id}?acc_token=...`  ``{“data”:{“status”:”active.enquiries”}}`` changes status of tender (according to the request), therefore, publishes it ("visualizes" it in the `GET /tenders list`). Transfer of the tender to ``active.enquiries`` status through a separate request (publication). Work with errors You can view more detailed error description :ref:`here <errors>`. Project-Id-Version: openprocurement.api 0.12a1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-12-14 15:39+0200
PO-Revision-Date: 2016-12-14 15:41+0200
Last-Translator: Zoriana Zaiats <sorenabell@quintagroup.com>
Language: uk
Language-Team: Ukrainian <info@quintagroup.com>
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.4.0
 Двофазний коміт При запиті `POST /tenders` передається закупівля зі статусом ``draft``. В результаті виконання запиту віддається ``acc_token`` для подальшого управління закупівлею. Всі закупівлі, які були створені в ЦБД, але не опубліковані, не будуть відображатись на майданчику і, відповідно, не будуть призводити до їх оголошення. Створення закупівлі за допомогою двофазного коміта Створення закупівлі за допомогою однофазного коміта Створення закупівлі Створення закупівлі у статусі ``draft``. Ось приклад помилки неправильно сформованого запиту. Ця помилка вказує, що `data` не знайдено у тілі JSON. У випадку неуспішності запиту та/або 5xx помилки, перевірте модифікований об'єкт (закупівлю, пропозицію, контракт і т.п.), оскільки 5xx помилка не обов'язково означає, що запит не відбувся. Варто повторювати запит з певним інтервалом, доки він не пройде успішно. Механізм створення двофазного коміта Публікування закупівлі Повторення запиту на публікацію, у випадку проблем з отриманням відповіді від сервера, не буде спричиняти помилок. Відсилання однофазного запиту на створення закупівлі (`POST /tenders`), за “старим” механізмом, після якого закупівля створюється одразу в статусі ``active.enquiries``: Закупівля стає доступною після успішного та послідовного виконання двох наступних запитів: Закупівля зі статусом ``draft`` "невидима" в переліку `GET /tenders`. Її, зокрема, не помічає хронограф і не перемикає статуси. Двофазний коміт пропонує механізм, завдяки якому в ЦБД будуть опубліковані тільки ті закупівлі, над якими майданчик має контроль і змогу самостійно скасувати їх дублікати. Новий механізм доступний паралельно зі “старим”. “Старий”, імовірно, буде вимкнено в одному з наступних release-ів. Причиною виникнення дублікатів закупівель є ситуації, коли автор запиту на створення закупівлі не отримував відповіді від сервера про її створення, і, відповідно, повторював спробу, що призводило до дублювання закупівлі. Видалення таких закупівель вимагало адміністративного втручання. Запит `PATCH /tenders/{id}?acc_token=...`    ``{“data”:{“status”:”active.enquiries”}}`` змінює статус закупівлі (згідно із запитом) і, відповідно, цим публікує її (“візуалізує” її в переліку `GET /tenders`). Переведення закупівлі в статус ``active.enquiries`` окремим запитом (публікація). Робота з помилками Детальніший опис помилок та рекомендацій щодо дій при їх виникненні описаний у розділі :ref:`Коди стану <errors>`. 